# ROcrate-interface
Initial development in creating an interface between workflow languages and a LivePublication RO-crate specification. 

## Executing CWL workflow & moduels

### Workflow execution
cwltool --outdir *anyoutdirectory* CWL/Worklfows/workflow.cwl CWL/Jobs/workflowjob.yaml

### Textjob execution
cwltool --outdir *anyoutdirectory* CWL/Worklfows/text-gen.cwl CWL/Jobs/textjob.yaml

### Figjob execution
cwltool --outdir *anyoutdirectory* CWL/Worklfows/fig-gen.cwl CWL/Jobs/figjob.yaml 

## RO-Crate interface

[RO-Crate specification 1.1](https://www.researchobject.org/ro-crate/1.1/)

Once the full workflow is executed with cwlprov, gen-crate can be used to generate a crate for LP ingestion. 