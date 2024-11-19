<h1> GCloud VM Creation Script </h1>


<h4>This bash script connects to a Google Cloud project using a service account and creates a Virtual Machine (VM Instance) in the desired location with specified configurations.</h4>


<h2>Pre-Requisites:</h2>

Before running the script, ensure the following are in place:

<h4> 1)Google Cloud SDK: </h4>
        Install the Google Cloud SDK and ensure it is properly set up.
        Alternatively, the script will download and install it automatically if not found.

<h4> 2)Service Account Key: </h4>
        A service account key file (.json) with appropriate permissions to create VM instances.
        The service account must have:
            Compute Admin role.
            Service Account User role.
            Editor role(for selecting the project)

<h4> 3)Permissions: </h4>
        The authenticated user or service account should have permissions to create resources.

<h4> 4)Bash Shell: </h4>
        The script is designed for Unix-like environments (Linux or macOS) with bash.


<h2> Necessary Steps to Run the Script: </h2>

<h4> 1)Clone or Download the Script: </h4>
        Download the script or clone the repository containing the script.

<h4> 2)Set Up Your Environment: </h4>
        Update all the varaibles in the script as required

<h4> 3)Make the Script Executable: Run the following command to give execution permissions: </h4>

chmod +x script_name.sh

<h4> 4)Run the Script: Execute the script using: </h4>

    ./script_name.sh


<h2> Execution Flow: </h2>

<h4> 1)Pre-checks: </h4>
        The script checks if the Google Cloud SDK is installed. If not, it downloads and installs the SDK.

<h4> 2)Authentication: </h4>
        The script authenticates with your Google Cloud project using the provided service account JSON file.

<h4> 3)Validation: </h4>
        It checks if the VM with the specified name already exists in the given zone.

<h4> 4)VM Creation: </h4>
        If the VM doesn’t exist, the script creates a new instance using the specified parameters:
            Image Project: Defaults to debian-cloud.
            Image Family: Defaults to debian-11.
            Network: Defaults to default.

<h4> 5)Error Handling:  </h4>
        If any step fails, the script provides appropriate error messages and exits.

<h4> 6)Completion:  </h4>
        Once the VM is created, the script confirms success.


<h2> Script Customization: </h2>

You can customize the following parameters directly in the script:

    name: The name of the VM instance.
    zone: The zone for the VM.
    machine: The machine type (e.g., e2-micro, n1-standard-1).
    project: The name of the project where the vm is to be created.
    email: The email of the service account to be used.
    key_location: The path where the key is stored in the system.
    image-project: The image project (default is debian-cloud).
    image-family: The image family (default is debian-11).


<h2> Important Notes: </h2>

    Ensure you have sufficient quotas in your Google Cloud project to create the VM instance.
    The script assumes default network and firewall settings. Update the network configurations in the script if needed.
    Logs and errors are displayed on the terminal for debugging purposes.

