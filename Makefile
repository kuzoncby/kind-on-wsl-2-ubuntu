.PHONY: clean
clean:
	rm -rf public

.PHONY: install
install:
	sudo gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/
	sudo gem install asciidoctor asciidoctor-diagram

#不要编译 PDF，非常慢
.PHONY: pdf
pdf: clean install
	sudo gem install asciidoctor-pdf asciidoctor-pdf-cjk-kai_gen_gothic --pre
	sudo asciidoctor-pdf-cjk-kai_gen_gothic-install
	asciidoctor -r asciidoctor-diagram -r asciidoctor-pdf-cjk-kai_gen_gothic -b pdf -a allow-uri-read=true asciidoc/index.adoc -D public

.PHONY: html
html: clean
	asciidoctor -r asciidoctor-diagram README.adoc -D public
	mv public/README.html public/index.html

.PHONY: docker
docker: clean
	docker run --user ${USER}:${USER} --rm -v $(PWD):/documents/ docker.io/asciidoctor/docker-asciidoctor:latest make html
