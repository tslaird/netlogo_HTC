# netlogo_HTC

This repository contains a sample workflow for running the NetLogo agent based modeling software

##Installing NetLogo for use on an HTC (in this case the OSG)

First, Netlogo must be downloaded and extracted onto the HTC cluster. A link to the Linux distribution of NetLogo can be obtained here: https://ccl.northwestern.edu/netlogo/6.2.0/

The command will be:

```
wget https://ccl.northwestern.edu/netlogo/6.2.0/NetLogo-6.2.0-64.tgz
```

Next, you will need to untar the download and then rename it to remove whitespaces:

```
tar -xzf NetLogo-6.2.0-64.tgz
```
```
mv NetLogo*0 NetLogo_6.2.0
```
Then you will need to find all the files that make NetLogo run and move them to the top level of the directory:

```
cp NetLogo_6.2.0/app* .
```

Next, copy the "netlogo-headless.sh" file to the top directory:

```
cp NetLogo_6.2.0/netlogo-headless.sh .
```

Once all of these files are in the top directory for the project you can delete the NetLogo_6.2.0 folder if desired since all the necessary files for running a headless version of netlogo have been obtained.

## Sample workflow

For this sample you can use the "wolf_sheep.nlogo" file included in the repository and which is a copy of the model file found in the "models" folder of the NetLogo download

There are several components to running the model on a HTC cluster.

First, a submission file must be used to tell the 



