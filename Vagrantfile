# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "focal", primary: true do |focal|
		focal.vm.box = "ubuntu/focal64"
		focal.vm.synced_folder "./", "/shared",
                owner: "vagrant", group: "vagrant"
        focal.vm.provider "virtualbox" do |vb|
			vb.gui = true
			vb.name = "Quartus_Ubuntu"
			vb.cpus = "2"
			vb.memory = "4096"
			vb.customize ["modifyvm", :id, "--vram", "128"]
            vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
			vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
            vb.customize ["modifyvm", :id, "--audioin", "on"]
            vb.customize ["modifyvm", :id, "--audioout", "on"]
            vb.customize ["modifyvm", :id, "--audiocontroller", "hda"]
			vb.customize ["modifyvm", :id, "--usb", "on"]
			vb.customize ["modifyvm", :id, "--usbehci", "on"]
			vb.customize ["usbfilter", "add", "0", 
				"--target", :id, 
				"--name", "Altera DE-SoC",
				"--vendorid", "09fb",
				"--productid", "6010"]
			disk_image = File.join(File.dirname(File.expand_path(__FILE__)),
				'ubuntu_20_04.vdi')
			unless File.exist?(disk_image)
			vb.customize ['createhd',
						'--filename', disk_image,
						'--size', 160 * 1024]
			end
			vb.customize ['storageattach', :id,
						  '--storagectl', 'SCSI',
						  '--port', 2, '--device', 0,
						  '--type', 'hdd',
						  '--medium', disk_image]
			vb.customize ['storageattach', :id,
						  '--storagectl', 'IDE',
						  '--port', '0', '--device', '1',
						  '--type', 'dvddrive',
						  '--medium', 'emptydrive']
		end

		focal.vm.provision "shell", inline: <<-SHELL
			parted /dev/sdc mklabel msdos
			parted /dev/sdc mkpart primary 100 100%
			partprobe
			mkfs.xfs /dev/sdc1
			mkdir /workspace
			echo `blkid /dev/sdc1 | awk '{print$2}' | sed -e 's/"//g'` \
				/workspace   xfs   noatime,nobarrier   0   0 >> /etc/fstab
			mount /workspace
			chown -R vagrant:vagrant /workspace
			chmod 777 -R /workspace
		SHELL

		focal.vm.provision "shell",
			inline: "apt-get update"

        focal.vm.provision "shell",
			inline: "/bin/bash /shared/scripts/setup_host.sh"

        focal.vm.provision "shell",
			inline: "apt remove -y gdm3"

        focal.vm.provision "shell",
			inline: "apt-mark hold gdm3"

		#focal.vm.provision "shell",
		#	inline: "apt install -y kde-full || :"
		focal.vm.provision "shell",
			inline: "apt install -y kde-plasma-desktop || :"

        focal.vm.provision "shell",
			inline: "/bin/bash /shared/scripts/sddm_fix.sh"

        focal.vm.provision "shell",
			inline: "sudo apt update && sudo apt -y full-upgrade && sudo apt -y autoremove || :"

		focal.vm.provision "shell",
			inline: "sudo apt install -y virtualbox-guest-additions-iso virtualbox-guest-x11 || :"

		focal.vm.provision "shell",
			inline: "cat /root/.profile | grep PATH >> /home/vagrant/.profile || :"

		focal.vm.provision "shell",
			inline: "runuser -l vagrant -c  'source /shared/scripts/setup_simulator.sh' || :"

		focal.vm.provision "shell",
			inline: "mkdir /home/vagrant/Desktop || :"

		focal.vm.provision "shell",
			inline: "cp -f /shared/images/simulator_icon.png /home/vagrant/DESim/ || :"
		
		focal.vm.provision "shell",
			inline: "cp -f /shared/desktop_files/* /home/vagrant/Desktop/ || :"

		focal.vm.provision "shell",
			inline: "install -D -m644 /shared/quartus-free/quartus.desktop /home/vagrant/Desktop/quartus.desktop"

		focal.vm.provision "shell",
			inline: "install -D -m644 /shared/quartus-free/modelsim-ase.desktop /home/vagrant/Desktop/modelsim-ase.desktop"

		focal.vm.provision "shell",
			inline: "chown -R vagrant:vagrant /home/vagrant/* || :"

		focal.vm.provision "shell",
			inline: "chmod +x /home/vagrant/Desktop/* || :"

	end
end
