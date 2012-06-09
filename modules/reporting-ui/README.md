#Vigraha Reporting

## Build Requirements
    * JDK 1.6 (1.6.0_12)
    * Maven 2.2.1
    * MySql 5 (5.0.21)
    * Apache tomcat 6.5

## 1) Download the birt-runtime-3_7_2.zip
    2) Extract the birt-runtime-3_7_3.zip file
    3) set the "birt.viewer.home" path in the viewer/pom.xml to the
       extracted "birt-runtime-3_7_1/WebViewerExample" folder. This will copy the required libs from birt viewer.
    4) Add the mysql jdbc connector jar(mysql-connector-java-5.1.16.jar) into $CATALINA_HOME/lib
    5) Copy the context.xml in the viewer/src/main/resources/ to $CATALINA_HOME/conf/ and configure the DB properties. (This DB properties used by BIRT reports)
    6) Configure DB properties in viewer/src/main/resources/db.properties (This DB properties used by reporting module)
    7) Configure the logs path in viewer/src/main/resources/log4j.xml
    8) Set the base_url in reporting/viewer/src/main/webapp/WEB-INF/viewer.properties. eg: base_url=http://127.0.0.1:<tomcat_port>
    9) Once you deployed the webapp in tomcat, change the baseUR in viewer/WEB-INF/tlds/birt.tld as follows

eg:     <attribute>
            <name>baseURL</name>
            <required>true</required>
            <rtexprvalue>http://127.0.0.1:8080/</rtexprvalue>
            <description>
                Specifies base URL of BIRT viewer.
                Default to the current context.
            </description>
        </attribute>


## Configure and Deploy application on Tomcat
 1) Run mvn clean install from ${app.home}/reporting-ui
 2) Get the tomcat and copy the ${app.home}/reporting-ui/target/reporting-ui.war to
    $CATALINA_HOME/webapps/.
 3) Start the tomcat
 4) Go to web browser and type "http://<ip>:<port>/reporting-ui/index to view the app

