cwlVersion: v1.2
class: Workflow

requirements:
    InlineJavascriptRequirement: {} 

inputs:
    images: File[]
    tarfile: File

outputs:
    text: 
        type: File
        outputSource: genText/example_out
    montage:
        type: File
        outputSource: genfig/example_out


steps:
    genText:
        run: text-gen.cwl
        in:
            tarfile: tarfile
        out: [example_out]

    genfig:
        run: fig-gen.cwl
        in:
            images: images
        out: [example_out]

