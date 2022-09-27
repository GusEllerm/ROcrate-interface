#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool
baseCommand: [montage]
inputs:
    images:
        type: File[]
        inputBinding:
          position: 1
    montage:
        type: string
        default: "example-fig.png"
        inputBinding:
            position: 2

outputs:
    example_out:
        type: File
        outputBinding:
            glob: "$(inputs.montage)"