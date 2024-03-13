def localExtensionsPath = "config/localextensions.xml"
def ycommerceSpringPath = "bin/ext-template/ycommercewebservices/resources/ycommercewebservices-spring.xml"
def ycommerceWebSpringPath = "bin/ext-template/ycommercewebservices/web/webroot/WEB-INF/ycommercewebservices-web-spring.xml"
def ycommerceSecuritySpringPath = "bin/ext-template/ycommercewebservices/web/webroot/WEB-INF/config/security-spring.xml"
def productCockpitPropertiesPath = "bin/ext-content/productcockpit/project.properties"
def startScriptPath = "bin/platform/hybrisserver.sh"
def buildNumberPath = "bin/platform/build.number"

println "Reading Hybris version"
def buildNumberProps = new Properties()
new File(buildNumberPath).withInputStream { stream -> buildNumberProps.load(stream) }
def buildNumber = new ConfigSlurper().parse(buildNumberProps)
println "Hybris version is ${buildNumber.version}"

println "Creating backups of configuration files"
(new File("${localExtensionsPath}.bak")) << (new File(localExtensionsPath)).bytes
(new File("${ycommerceSpringPath}.bak")) << (new File(ycommerceSpringPath)).bytes
if (buildNumber.version < "5.4.0.0") {
    if (buildNumber.version >= "5.2.0.0") {
        (new File("${ycommerceSecuritySpringPath}.bak")) << (new File(ycommerceSecuritySpringPath)).bytes
    } else {
        (new File("${ycommerceWebSpringPath}.bak")) << (new File(ycommerceWebSpringPath)).bytes
    }
}
(new File("${productCockpitPropertiesPath}.bak")) << (new File(productCockpitPropertiesPath)).bytes
(new File("${startScriptPath}.bak")) << (new File(startScriptPath)).bytes

println "Creating output directory: target"
(new File("target")).mkdirs()

def parser = new XmlSlurper(false, false)
parser.keepWhitespace = true

println "Parsing ${localExtensionsPath}"
def localExtensions = parser.parse(localExtensionsPath)

println "Removing unnecessary extensions"
def extensions = localExtensions.extensions.extension.findAll { it.@name ==~ /^(b2b.*|yaccelerator.*|yb2b.*|accelerator.*|amazoncloud|azurecloud|gridfsstorage)$/ }
extensions.each { it.replaceNode {} }

if ((localExtensions.extensions.extension.findAll { it.@name == "platformwebservices" }).isEmpty()) {
    //Needed for Hybris 5.1.1 which does not include platformwebservices in the default configuration
    println "Adding platformwebservices extension"
    localExtensions.extensions.appendNode ({ extension(name: "platformwebservices") })
}
if (buildNumber.version < "5.3.0.0") { //sampledata extension is dropped starting from Hybris 5.3
    if ((localExtensions.extensions.extension.findAll { it.@name == "sampledata" }).isEmpty()) {
        //Needed for Hybris 5.2 which does not include 'sampledata' in the default configuration
        println "Adding sampledata extension"
        localExtensions.extensions.appendNode ({ extension(name: "sampledata") })
    }
}

println "Writing changes to ${localExtensionsPath}"
def builder = new groovy.xml.StreamingMarkupBuilder()
def writer = new FileWriter(localExtensionsPath)
writer << builder.bind { mkp.yield localExtensions }



println "Parsing ${ycommerceSpringPath}"
def ycommerceWebServicesConfigSpring = parser.parse(ycommerceSpringPath)

println "Adjusting image format mapping"
def imageFormatMapping = ycommerceWebServicesConfigSpring.bean.find { it.@id == "cwsImageFormatMapping" }
imageFormatMapping.replaceNode {
    bean(id: "cwsImageFormatMapping", parent: "defaultImageFormatMapping") {
        property(name: "mapping") {
            map {
                entry(key: "superZoom", value: "1200Wx1200H")
                entry(key: "zoom", value: "515Wx515H")
                entry(key: "store", value: "365Wx246H")
                entry(key: "product", value: "product")
                entry(key: "thumbnail", value: "thumbnail")
                entry(key: "cartIcon", value: "65Wx65H")
                entry(key: "styleSwatch", value: "30Wx30H")
            }
        }
    }
}

println "Writing changes to ${ycommerceSpringPath}"
builder = new groovy.xml.StreamingMarkupBuilder()
writer = new FileWriter(ycommerceSpringPath)
writer << builder.bind { mkp.yield ycommerceWebServicesConfigSpring }


if (buildNumber.version < "5.4.0.0") {
    println "Configuring persistent token store"
    def tokenStoreConfigPath = buildNumber.version >= "5.2.0.0" ? ycommerceSecuritySpringPath : ycommerceWebSpringPath

    println "Parsing ${tokenStoreConfigPath}"
    def tokenStoreConfig = parser.parse(tokenStoreConfigPath)

    println "Adjusting token store's data source"
    def dataSources = buildNumber.version >= "5.2.0.0" ? tokenStoreConfig.beans.bean.findAll {
        it.@id == "dataSource"
    } :
            tokenStoreConfig.bean.findAll { it.@id == "dataSource" }
    dataSources.each { it.replaceNode {} }

    def tokenStore = buildNumber.version >= "5.2.0.0" ? tokenStoreConfig.beans.bean.find { it.@id == "tokenStore" } :
            tokenStoreConfig.bean.find { it.@id == "tokenStore" }
    tokenStore.replaceNode {
        bean(id: "dataSource", "class": "org.apache.commons.dbcp.BasicDataSource", "destroy-method": "close") {
            property(name: "driverClassName", value: "org.hsqldb.jdbcDriver")
            property(name: "url", value: 'jdbc:hsqldb:file:${BUNDLE_HYBRIS_HOME}/data/hsqldb/mydb')
            property(name: "username", value: "sa")
            property(name: "password", value: "")
        }
        bean(id: "tokenStore", "class": "org.springframework.security.oauth2.provider.token.JdbcTokenStore") {
            "constructor-arg"(index: "0") {
                ref(bean: "dataSource")
            }
        }
    }

    println "Writing changes to ${tokenStoreConfigPath}"
    builder = new groovy.xml.StreamingMarkupBuilder()
    writer = new FileWriter(tokenStoreConfigPath)
    writer << builder.bind { mkp.yield tokenStoreConfig }
}


println "Reading ${productCockpitPropertiesPath}"
def productCockpitPropertiesFile = new File(productCockpitPropertiesPath)
def productCockpitProperties = productCockpitPropertiesFile.text

println "Enabling product express update for Staged catalog versions"
if (productCockpitProperties.contains("#expressUpdateCatalogVersion=Online")) {
    //for Hybris versions prior 5.1.1
    productCockpitProperties = productCockpitProperties.replaceAll(/#expressUpdateCatalogVersion=Online/, "expressUpdateCatalogVersion=Staged")
} else if (productCockpitProperties.contains("#expressUpdateCatalogVersions=hwcatalog:Online,clothescatalog:Staged")) {
    //Needed for Hybris 5.1.1
    productCockpitProperties = productCockpitProperties.replaceAll(/#expressUpdateCatalogVersions=hwcatalog:Online,clothescatalog:Staged/, "expressUpdateCatalogVersions=outdoors:Staged")
} else {
    println "No modification performed on ${productCockpitPropertiesPath}"
}

println "Writing changes to ${productCockpitPropertiesPath}"
productCockpitPropertiesFile.text = productCockpitProperties



println "Reading ${startScriptPath}"
def startScriptFile = new File(startScriptPath)
def startScript = startScriptFile.text

println "Making sure BUNDLE_HYBRIS_HOME environment variable is set in start script"
def exportBundleHybrisHome = "export BUNDLE_HYBRIS_HOME=\"${new File('.').canonicalPath}\""
startScript = startScript.replaceFirst(/(?m)^\s*$/, exportBundleHybrisHome)

println "Writing changes to ${startScriptPath}"
startScriptFile.text = startScript
println "Added line: ${exportBundleHybrisHome}"
