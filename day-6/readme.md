


      # Backup Management Script

This Bash script automates the process of creating compressed backups of a specified file and manages these backups by retaining only the last 5 backups. It ensures efficient storage management and simplifies backup rotation.

---

## 🛠 Prerequisites

Before running the script, ensure the following:

- **Operating System**: Linux-based system.
- **Dependencies**:
  - `zip`: The script installs this utility automatically if it is not present.
- **User Permissions**: The user running the script must have `sudo` privileges for installing dependencies.
- **Arguments**:
  - The **source file** (the file to be backed up).
  - The **backup folder** (where backups will be stored).

---

## 🚀 Steps to Run

1. Clone or download the script file (e.g., `backup.sh`) to your system.
2. Make the script executable:
   ```bash
   chmod +x backup.sh

    Execute the script with the following command:

    ./backup.sh <path-to-source-file> <path-to-backup-folder>

        Replace <path-to-source-file> with the path of the file to back up.
        Replace <path-to-backup-folder> with the folder where backups will be stored.

📋 Execution Flow
1️⃣ Input Validation

    Checks if the required arguments (source file and backup folder) are provided.
    If not, the script exits with an error message.

2️⃣ Setting Global Variables

    main: Stores the path of the backup folder.
    backup: Stores the path of the source file.
    timestamp: Generates a unique timestamp for naming the backup file.

3️⃣ Dependency Installation

    Installs the zip utility using sudo apt install zip.
    Exits with an error if installation fails.

4️⃣ Backup Creation

    Compresses the source file into a .zip file with a timestamped name.
    Saves the backup in the specified backup folder.
    Exits if the compression process fails.

5️⃣ Backup Rotation

    Lists all backup files in the folder, sorted by creation time (newest first).
    Retains only the last 5 backups.
    Deletes older backups if more than 5 backups exist.

6️⃣ Output Messages

    Displays success and error messages during each step for better debugging and monitoring.

🔧 Needed Modifications
1️⃣ Dependency Installation

    If not using a Debian-based system, modify the dependency installation command:

    sudo apt install zip

    Replace it with the equivalent for your package manager.

2️⃣ Backup File Naming

    Change the format of the timestamp in the zip file name if required:

    timestamp=$(date '+%y-%m-%d-%H-%M')

3️⃣ Backup File Limit

    To change the number of backups to retain (default is 5), modify this condition:

    if [ ${#backup_array[@]} -gt 5 ]; then

    Replace 5 with the desired number of backups to retain.

4️⃣ Error Handling

    Add specific checks to verify the existence of the source file and the backup directory before proceeding.

5️⃣ Cross-Platform Compatibility

    For non-Linux systems, adjust commands like ls and rm to platform-specific equivalents.
