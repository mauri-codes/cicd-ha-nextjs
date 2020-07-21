echo "app start ;)"
source /home/ec2-user/.bash_profile

cd /home/ec2-user/nextjs-app
npm install
npm run build
npm run start > /dev/null 2> /dev/null < /dev/null &
