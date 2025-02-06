import json
import sys
import yaml


def main(input_f, output_f):
    try:
        with open(input_f, "r") as file:
            file = json.load(file)
            categories = """
            license:
                forbidden: []
                restricted: []
                reciprocal: []
                notice: []
                unencumbered: []
                permissive: []
            """
            yamlFile = yaml.safe_load(categories)

            for policy in file['items']:
                if policy.get('evaluation_result') == "Forbidden":
                    yamlFile['license']['forbidden'].append(policy.get('spdx_license'))
                elif policy.get('evaluation_result') == "Review required":
                    yamlFile['license']['notice'].append(policy.get('spdx_license'))
                elif policy.get('evaluation_result') == "Allowed":
                    yamlFile['license']['permissive'].append(policy.get('spdx_license'))

            with open(output_f, 'w') as output:
                yaml.dump(yamlFile, output)
    except FileNotFoundError:
        print(f"File not found: {input_file}")
        sys.exit(1)
    except Exception as e:
        print(f"An error occurred: {e}")
        sys.exit(1)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <input_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]
    main(input_file, output_file)
