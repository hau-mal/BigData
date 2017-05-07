# NiFi on Azure VM



<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fhau-mal%2FBigData%2Fmaster%2Fnifi%2Fvm-template%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>



### Summary
This template deploys NiFi on an Azure Ubuntu 16.04 VM. The main purpose is for evaluation and dev of Apache NiFi. It is a plain installation with no security or HA configurations. You should modify Source Address Variable to restrict inbound traffic. 

### Packaging
* build-essential
* packaging-dev
* Java Open JDK 8
* Apache NiFi 1.1.2

### Post deployment tasks
You can access NiFi via http://<dnsname>:8080/nifi/ 

Default port 8080 is used for this installation.
