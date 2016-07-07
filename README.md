#Boinc-Runner
###Purpose:
I've installed the Boinc client on various computers I've owned over the years and it always bothered me. There was some reason I uninstalled it shortly thereafter. This Docker image is made to streamline the Boinc setup and allow me to run it in AWS on spot instances so I don't have to deal with the heat or electricity bill.

-

###The Docker Image
#####Use:
	docker run -d --log-driver=none --name boinc jonnymo5/boinc --attach_project <BOINC_URL> <BOINC_KEY>

This will launch the client and attach to the project you provide with the account you provide. The logs are disabled because there is some chatter about trying to find the mouse and other inputs that don't apply when running in a container and I don't want disk getting filled up with nonsense. If you need to see the logs just change the driver to json.

-

###The Packer Image
#####Purpose: 
A simple AMI to be used in AWS spot instances.

#####Build:
**Note that the template uses us-west-2 so change it if you want a different region.*

1. `cd packer/`
2. Export ENV variables
	3. `AWS_KEY` - An AWS key with permissions to build packer images.
	4. `AWS_SECRET` - An AWS secret for the AWS_KEY.
	5. `WCG_URL` - I run World Community Grid but any Boinc project url.
	6. `WCG_KEY` - Your project key for the Boinc project. 
7. `./build.sh templates/boinc.json`

#####Run:
Start an AWS instance using the AMI ID shown at the end of the Packer run. The client will launch and start crunching data automatically.

#####Spot Instances:
One of the key benefits to spot instances is that you can get around an 80% discount most of the time. The trade off is that you can lose your instance at any time. I pick a price point that should keep my instance running most of the time and set up a persistent request so the instance will stop and start as the price moves. You want your instance to run long enough to complete some work units because when it stops you will lose the work in progress.

-

###Issues
Currently the way that WCG identifies clients causes each new instance of the Docker container to replace the one before it. This means I can only have one container running anywhere. I don't know if this applies to other Boinc projects as well but be aware of this limitation.
