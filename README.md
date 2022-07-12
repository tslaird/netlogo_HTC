# netlogo_HTC

This repository contains a sample workflow for running the NetLogo agent based modeling software

### Installing NetLogo for use on an HTC (in this case the OSG)

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

The last step is installing the Java environment. This can be done with the command:

```
wget https://download.oracle.com/java/17/archive/jdk-17.0.1_linux-x64_bin.tar.gz && tar -xzf jdk-17.0.1_linux-x64_bin.tar.gz
```

### Sample workflow

For this sample you can use the "wolf_sheep.nlogo" file included in the repository and which is a copy of the model file found in the "models" folder of the NetLogo download

There are several components to running the model on a HTC cluster.

First, a submission file must be used to specify such things as which files to transfer over, what files to transfer back, what OS requirements there are for your jobs, how many jobs to run etc.

The submission file for this sample workflow is "netlogo_submission.sub"

In this	case the queue method is used to run the same netlogo model 10 times.


Next, there is a wrapper script which unzipps the Java program sent to each node and the runs the "netlogo-headless.sh" script on the model file "wolf_sheep.nlogo"

This wrapper script is called by the "netlogo_submission.sub" file on each node it is executed

To run the submission file on the OSG you can enter the command:
```
condor_submit netlogo_submission.sub
```

#### Modifications

This repository is intended to be a starting point for creating high throughput NetLogo workflows.

In particular an important thing to decide is how to best distribute the model across the computing environment. For instance each node could run a model 1000 times and that could be submitted across 1000 nodes using "queue 1000" in the submission file. This would result in a total of 1e6 iterations of a model distributed in chunks of 1000.


