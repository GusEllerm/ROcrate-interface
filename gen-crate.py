from rocrate.rocrate import ROCrate, ComputerLanguage
import json

# Get prov ids for outputs


crate = ROCrate()
workflow_langauge = crate.add

# workflow, example-fig, hello.txt, wrap PROV up
workflow = crate.add_file("Workflow outputs/PROV/workflow/packed.cwl", properties={
    "name": "example-workflow-output.cwl",
    "@type": ["File", "SoftwareSourceCode", "HowTo"],
    "programmingLanguage": {"@id": "https://w3id.org/workflowhub/workflow-ro-crate#cwl"}
})

cwl = crate.add(ComputerLanguage(crate, "https://w3id.org/workflowhub/workflow-ro-crate#cwl", properties={
    "name": "Common Workflow Langauge",
    "alternativeName": "CWL",
    "identifier": {"@id": "https://w3id.org/cwl/v1.2/"},
    "url": {"@id": "https://www.commonwl.org/"}
}))

workflow_inputs = crate.add_file("Workflow outputs/PROV/workflow/primary-job.json", properties={
    "name": "Workflow inputs",
    "@type": ["File", "HowTo"],
    "programmingLanguage": {"@id": "https://www.json.org/json-en.html"}
})

workflow_outputs = crate.add_file("Workflow outputs/PROV/workflow/primary-output.json", properties={
    "name": "Workflow outputs",
    "@type": ["File", "HowTo"],
    "programmingLanguage": {"@id": "https://www.json.org/json-en.html"}
})

json = crate.add(ComputerLanguage(crate, "https://www.json.org/json-en.html", properties={
    "name": "JavaScript Object Notation",
    "alternativeName": "JSON"    
}))

fig1 = crate.add_file("Workflow outputs/example-fig.png", properties={
    "name": "Figure1",
    "encodingFormat": "image/png",
    "PROV_ID": ""
})

text1 = crate.add_file("Workflow outputs/hello.txt", properties={
    "name": "Figure1",
    "encodingFormat": ".txt",
    "PROV_ID": ""
})



crate.write("LP-crate")