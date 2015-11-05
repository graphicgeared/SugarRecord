doc:
	bundle install
	bundle exec jazzy --swift-version 2.1 -o Documentation -c --source-directory SugarRecord/ -a GitDo -u https://github.com/gitdoapp -m SugarRecord -g https://github.com/gitdoapp/sugarrecord --readme README.md
	
ci:
	set -o pipefail && xcodebuild build -project SugarRecord/SugarRecord.xcodeproj -scheme "SugarRecord-iOS" ONLY_ACTIVE_ARCH=NO | xcpretty -c
	set -o pipefail && xcodebuild build -project SugarRecord/SugarRecord.xcodeproj -scheme "SugarRecord-OSX" ONLY_ACTIVE_ARCH=NO | xcpretty -c
	set -o pipefail && xcodebuild build -project SugarRecord/SugarRecord.xcodeproj -scheme "SugarRecord-tvOS" ONLY_ACTIVE_ARCH=NO | xcpretty -c
	set -o pipefail && xcodebuild build -project SugarRecord/SugarRecord.xcodeproj -scheme "SugarRecord-watchOS" ONLY_ACTIVE_ARCH=NO | xcpretty -c

test:
	set -o pipefail && xcodebuild clean test -project SugarRecord/SugarRecord.xcodeproj -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.1' -scheme "SugarRecord-iOS" ONLY_ACTIVE_ARCH=NO | xcpretty -c
