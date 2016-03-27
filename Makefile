
build:
	docker run -ti --rm -v $$PWD:/build alpine:3.3 /build/build.sh

clean:
	rm -rf build

test: 
	docker run -ti --rm -v $$PWD:/build alpine:3.3 sh -c "/build/sassc -v && echo "a{b{color:red}}" | /build/sassc -s"

