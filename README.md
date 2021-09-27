# Vagrant With Quartus

## Description

This is a virtual machine configurator to set up Ubuntu version 20.04 with Quartus Prime Lite edition. The intended audience for this repository is for students of [ELEN20006](https://handbook.unimelb.edu.au/subjects/elen20006/eligibility-and-requirements). 
This will provide an environment with:
* Quartus Prime Lite edition (Version 20.1.1)
* Modelsim Starter Edition
* [DESim](https://github.com/fpgacademy/DESim)  

If you wish to use your own machine for this class, it is recommended that you use the virtual machine. This makes it easier for the demonstrators to help you as there is unlikely to be any issues with the installation of Quartus.

Successfully setting up this virtual machine will allow the demonstrators to help you more e

## Tested working on
Operating System | CPU | Memory
---------|----------|---------
Windows 10      |  Intel i5 | 16GB DDR3 RAM
macOS Big Sur   |  Intel i5 | 8GB LPDDR3 RAM
Arch Linux      | AMD Ryzen | 32GB DDR4 RAM
 

## Prerequisites



* [VirtualBox (with extensions)](https://www.virtualbox.org/wiki/Downloads "VirtualBox Download Page")
* [Vagrant](https://www.vagrantup.com/downloads "Vagrant Download Page") 
* [Git](https://git-scm.com/downloads "Git Download Page") 
* Memory: 8GB or more recommended (if you have less see step 6 in instructions)
* Hard Drive Space: At least 40GB free space (final intalled size is <span>&#8773;</span>  30GB)




## Usage
Simply run the respective run script for your operating system:

Windows (PowerShell): `.\run_windows`

Linux (bash): `./run_linux.sh`

Mac (terminal): `./run_unix`

Note: This will likely take 1-2 hours (depending on your internet speed). 

# Complete Installation Steps (Windows and Mac)

1. Installing  [Virtualbox](https://www.virtualbox.org/wiki/Downloads "VirtualBox Download Page")

        VirtualBox will be used to run the Ubuntu virtual machine for this. 

        Download and install the hosts package for your personal machine (OS X for Mac, etc)

    **Windows**

    Windows simply download and install the Windows hosts package.

    **Mac** 

    Download and install the OS X hosts package. OS X will ask for a file permission change. This will require a file extension permission:

![Alt text](./images/virtualbox.PNG "VirtualBox Downloads Page")

2. Installing [VirtualBox Extensions](https://www.virtualbox.org/wiki/Downloads "VirtualBox Download Page") 

        Virtualbox extensions will allow us to pass through USB 2.0 devices. This is required for programming the FPGA Development Boards (DE1-SoCs)
        The VirtualBox Extension Pack is also found on the downloads page for VirtualBox. Once VirtualBox is installed, simply double click the package to install.

3. Installing [Vagrant](https://www.vagrantup.com/downloads "Vagrant Download Page") 

    * Vagrant is used to create and configure our virtual machine. 

    * Download and install Vagrant.

4. Installing [Git](https://git-scm.com/downloads "Git Download Page") 

    This repository contains the necessary scripts and configurations Vagrant requires to build up the virtual machine. 

    **Windows**

        Download and install git from the webpage.

    **Mac** 
    
        In spotlight search, type in terminal. Open the terminal, type in git and hit enter. A prompt will appear to install xcode, click yes.

5. Downloading this repository

    Find a spot on your computer to clone this repository to. Any sensible location is fine.

    **Windows**

    1. Create the folder where you want to store this repository. On Windows I use C:\workspace\  

        If you are unsure what to do here. Type PowerShell into your search bar and open powershell. Inside of Powershell type: `mkdir C:\workspace`

    2. . Shift+Right Click in the folder that you wish to clone to and click "Open PowerShell window here".
    ![Alt text](./images/opening_a_shell.PNG "Opening PowerShell")

    3. . Copy and paste `git clone https://gitlab.eng.unimelb.edu.au/david_lynch/vagrant-with-quartus.git` into powershell and then hit enter (don't close PowerShell).
    ![Alt text](./images/git_clone.PNG "Git Clone")

    **Mac**
    
    1. Create the folder where you want to store this repository. On Mac (and Linux) I use ~/workspace/ 

    If you are unsure what to do here. Type terminal into your search bar and open a terminal. Inside of the terminal type: `mkdir ~/workspace/`

    **Note**: ~/ corresponds the the home folder in Linux and Mac operating systems. For example, on a Mac if your username was John then ~/Desktop/ = /Users/John/Desktop/

    2.  Open a terminal again from spotlight. You will need to know the path of the folder you created. Assuming you created it in ~/workspace/ - type cd ~

    3. Copy and paste `git clone https://gitlab.eng.unimelb.edu.au/david_lynch/vagrant-with-quartus.git` into the terminal and then hit enter (don't close the terminal).
    
6. Configuring your virtual machine (optional)

    * By default, this virtual machine will be assigned 4GB of RAM and 2 CPU cores. 
    * This is an attempt to cater for all students. 
    * If you have <span>&#8805;</span>16GB of memory and <span>&#8805;</span> 4 CPU cores, this is where you have the option of increasing the virtual machines allocation. Increasing the amount of memory is recommended if you can. Increasing the number of CPU cores may help but in my experience 2 is fine for Quartus Lite.

    Inside of the  downloaded folder, there is a file called _Vagrantfile_

7. Creating the virtual machine

    **NOTE**: THIS NEXT STEP WILL DOWNLOAD 30GB OF FILES, ENSURE YOU HAVE ENOUGH SPACE ON YOUR COMPUTER
    
   

## Contribution

Anyone is welcome to contribute to this project. To do so, clone the local repository to your local workspace, create a git feature branch and request a pull request. Upon review, the pull request will then be accepted or denied.


## Author

David Lynch