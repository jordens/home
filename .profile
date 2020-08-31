umask 022

if [ -n "$BASH_VERSION" ]; then
	. ~/.bashrc
fi

if [ -e /home/rj/.nix-profile/etc/profile.d/nix.sh ]; then
	. /home/rj/.nix-profile/etc/profile.d/nix.sh;
fi
