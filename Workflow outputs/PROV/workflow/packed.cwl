{
    "$graph": [
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "montage"
            ],
            "inputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#fig-gen.cwl/images"
                },
                {
                    "type": "string",
                    "default": "example-fig.png",
                    "inputBinding": {
                        "position": 2
                    },
                    "id": "#fig-gen.cwl/montage"
                }
            ],
            "id": "#fig-gen.cwl",
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.montage)"
                    },
                    "id": "#fig-gen.cwl/example_out"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "tar",
                "--extract"
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "prefix": "--file"
                    },
                    "id": "#text-gen.cwl/tarfile"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "hello.txt"
                    },
                    "id": "#text-gen.cwl/example_out"
                }
            ],
            "id": "#text-gen.cwl"
        },
        {
            "class": "Workflow",
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "inputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "id": "#main/images"
                },
                {
                    "type": "File",
                    "id": "#main/tarfile"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#main/genfig/example_out",
                    "id": "#main/montage"
                },
                {
                    "type": "File",
                    "outputSource": "#main/genText/example_out",
                    "id": "#main/text"
                }
            ],
            "steps": [
                {
                    "run": "#text-gen.cwl",
                    "in": [
                        {
                            "source": "#main/tarfile",
                            "id": "#main/genText/tarfile"
                        }
                    ],
                    "out": [
                        "#main/genText/example_out"
                    ],
                    "id": "#main/genText"
                },
                {
                    "run": "#fig-gen.cwl",
                    "in": [
                        {
                            "source": "#main/images",
                            "id": "#main/genfig/images"
                        }
                    ],
                    "out": [
                        "#main/genfig/example_out"
                    ],
                    "id": "#main/genfig"
                }
            ],
            "id": "#main"
        }
    ],
    "cwlVersion": "v1.2"
}