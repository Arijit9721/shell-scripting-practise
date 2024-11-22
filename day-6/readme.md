<h1> Backup Management Script </h1>
 This Bash script automates the process of creating compressed backups of a specified file and manages these backups by retaining only the last 5 backups. It ensures efficient storage management and simplifies backup rotation.

## 🛠 Prerequisites

Before running the script, ensure the following:

- **Operating System**: Linux-based system.
- **Dependencies**:
  - `zip`: The script installs this utility automatically if it is not present.
- **User Permissions**: The user running the script must have `sudo` privileges for installing dependencies.
- **Arguments**:
  - The **source file** (the file to be backed up).
  - The **backup folder** (where backups will be stored).

## 🚀 Steps to Run

1. Clone or download the script file (e.g., `backup.sh`) to your system.
2. Make the script executable:
   ```bash
   chmod +x backup.sh
   ```
    Execute the script with the following command:

    ./backup.sh <path-to-source-file> <path-to-backup-folder>

        Replace <path-to-source-file> with the path of the file to back up.
        Replace <path-to-backup-folder> with the folder where backups will be stored.

<h2>📋 Execution Flow</h2>
<h4>1️⃣ Input Validation</h4>
    Checks if the required arguments (source file and backup folder) are provided.
    If not, the script exits with an error message.

<h4>2️⃣ Setting Global Variables</h4>
   main: Stores the path of the backup folder.
   
   backup: Stores the path of the source file.
   
  timestamp: Generates a unique timestamp for naming the backup file.

<h4>3️⃣ Dependency Installation</h4>
    Installs the zip utility using sudo apt install zip.
    Exits with an error if installation fails.

<h4>4️⃣ Backup Creation</h4>
    Compresses the source file into a .zip file with a timestamped name.
    Saves the backup in the specified backup folder.
    Exits if the compression process fails.

<h4>5️⃣ Backup Rotation</h4>
    Lists all backup files in the folder, sorted by creation time (newest first).
    Retains only the last 5 backups.
    Deletes older backups if more than 5 backups exist.

<h4>6️⃣ Output Messages</h4>
    Displays success and error messages during each step for better debugging and monitoring.

<h2> 🔧 Needed Modifications</h2>
<h4>1️⃣ Dependency Installation</h4>

   If not using a Debian-based system, modify the dependency installation command:

    sudo apt install zip

   Replace it with the equivalent for your package manager.

<h4>2️⃣ Backup File Naming</h4>

   Change the format of the timestamp in the zip file name if required:

    timestamp=$(date '+%y-%m-%d-%H-%M')

<h4>3️⃣ Backup File Limit</h4>

   To change the number of backups to retain (default is 5), modify this condition:

    if [ ${#backup_array[@]} -gt 5 ]; then

   Replace 5 with the desired number of backups to retain.

<h4>4️⃣ Error Handling</h4>

   Add specific checks to verify the existence of the source file and the backup directory before proceeding.

<h4>5️⃣ Cross-Platform Compatibility</h4>

   For non-Linux systems, adjust commands like ls and rm to platform-specific equivalents.
