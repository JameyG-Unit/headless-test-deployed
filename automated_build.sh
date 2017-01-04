# Copy static site
CWD=`pwd`

# Clone Pages repository
cd /tmp
git clone git@github.com:JameyG-Unit/headless-test-deployed.git build

# Trigger Jekyll rebuild
cd $CWD
bundle exec jekyll contentful
bundle exec jekyll build

# Push newly built repository
cp -r $CWD/_site/* /tmp/build

cd /tmp/build

git config --global user.email "jamey.greenwood@theunit.co.uk"
git config --global user.name "Jamey Greenwood"

git add .
git commit -m "Automated Rebuild"
git push -f origin master
