echo "Going to download and get a newest translation"
export APP_NAME=$1 export CROWDIN_API=$2 yarn download & yarn unparser
if [[ `git status --porcelain` ]]; then
  echo "Crowndin have some new update translation"
  
else
  echo "No Change"
echo "Done"