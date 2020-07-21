echo "before install ;)"
source /home/ec2-user/.bash_profile

killall node
rm -rf /home/ec2-user/nextjs-app


curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
. ~/.nvm/nvm.sh
nvm install node
