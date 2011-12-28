#!/bin/bash

function failed()
{
  echo "Failed $*: $@" >&2
  exit 1
}

export OUTPUT=$WORKSPACE/output
rm -rf $OUTPUT
mkdir -p $OUTPUT

/Developer/usr/bin/xcodebuild -target MWFeedParser -configuration Release build || failed build;

cd $WORKSPACE/build/Release-iphoneuniversal || failed output;
rm MWFeedParser
zip -r -y -9 $OUTPUT/MWFeedParser.framework.zip MWFeedParser.framework
