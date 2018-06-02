echo "ℹ️  Building upload archive..."

cd 'scripts'
mkdir 'temp'
cp '../index.js' 'temp/index.js'
cp '../package.json' 'temp/package.json'

tar -zcvf ../archive.tar.gz 'temp'
rm -f -r 'temp'

echo "✅  Done"
