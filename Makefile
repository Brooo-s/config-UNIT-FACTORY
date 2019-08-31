# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vyunak <vyunak@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/06/17 15:26:07 by vyunak            #+#    #+#              #
#    Updated: 2019/06/17 16:09:54 by vyunak           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

Packages = ~/Library/'Application Support'/'Sublime Text 3'/Packages
User = ~/Library/'Application Support'/'Sublime Text 3'/User

all:
	mkdir -p ~/.sl-cfg
	cp key.json ~/.sl-cfg/key.json
	cp settings.json ~/.sl-cfg/settings.json
	@rm -fr $(Packages)
	@mkdir -p $(Packages)/User
	@curl -o $(Packages)/ayu.zip https://codeload.github.com/dempfi/ayu/zip/4.0.2
	@unzip $(Packages)/ayu.zip -d $(Packages)
	@mv $(Packages)/ayu-4.0.2 $(Packages)/ayu
	@ln -s ~/Library/'Application Support'/'Sublime Text 3'/Packages/ayu ~/Library/'Application Support'/'Sublime Text 3'/Packages/User/ayu
	@cp ~/.sl-cfg/settings.json $(Packages)/User/Preferences.sublime-settings
	@cp ~/.sl-cfg/key.json $(Packages)/User/'Default (OSX).sublime-keymap'
	@rm -f ayu.zip
	@cp Makefile ~/.sl-cfg
	echo "alias sl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl $1'" >> ~/.zshrc
	echo "alias sl-c='make init -C ~/.sl-cfg'" >> ~/.zshrc

init:
	@rm -fr $(Packages)
	@mkdir -p $(Packages)/User
	curl -o $(Packages)/ayu.zip https://codeload.github.com/dempfi/ayu/zip/4.0.2
	@unzip $(Packages)/ayu.zip -d $(Packages)
	@mv $(Packages)/ayu-4.0.2 $(Packages)/ayu
	@ln -s ~/Library/'Application Support'/'Sublime Text 3'/Packages/ayu ~/Library/'Application Support'/'Sublime Text 3'/Packages/User/ayu
	@cp ~/.sl-cfg/settings.json $(Packages)/User/Preferences.sublime-settings
	@cp ~/.sl-cfg/key.json $(Packages)/User/'Default (OSX).sublime-keymap'
	@rm -f ayu.zip
	@echo 'Success!'
