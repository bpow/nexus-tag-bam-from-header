<!-- dx-header -->
# Set properties of a BAM file using its header (DNAnexus Platform App)

Applies properties to a file in DNANexus using fields from its BAM header

This is the source code for an app that runs on the DNAnexus Platform.
For more information about how to run or modify it, see
https://wiki.dnanexus.com/.
<!-- /dx-header -->


## Inputs

* **BAM file of interest** ``bamfile``: ``file``

## Outputs

* None

But the bamfile that you specified as input will have some shiny
new properties set from its interal metadata:

* ```SAMPLE_NAME``` set from **SM**
* ```LIBRARY_NAME``` set from **LB**
* ```RG_PU_FIELD``` set from **PU**
