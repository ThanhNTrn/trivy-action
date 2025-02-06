# mw-converter-trivy

The action converts a license policy file and converts the content into 
the trivy syntax. The action takes the ```JSON```file passed with the 
```license-policy``` parameter and delivers an ```yaml``` file as an output
which can be referenced with the parameter ```trivy-policy```.

## Usage

```
  - name: Use Action
    uses: ThanhNTrn/trivy-action@main
    id: convert-policy
    with:
      license-policy: "./license_policy.json"
      trivy-policy: "./trivy.yaml"
```

## Input

Currently, the input file must at least have the following structure

```json
{
  "items": [
    {
      "evaluation_result": "Forbidden | Review required | Allowed",
      "spdx_license": "license ID"
    }
  ]
}
```

## Output

The output file can be referenced as followed

```
  - name: Upload result
    uses: actions/upload-artifact@v4
    with:
      name: trivy-policy
      path: ${{ steps.convert-policy.outputs.trivy-yaml }}
```