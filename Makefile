TEST_PATH=./

help:
	@echo "    install"
	@echo "        Installs the needed dependencies."
	@echo "    interactive"
	@echo "        Train the dialogue model in interactive mode, allowing you to correct it."
	@echo "    train-nlu"
	@echo "        Train the natural language understanding using Rasa NLU."
	@echo "    train-core"
	@echo "        Train a dialogue model using Rasa core."
	@echo "    cmdline"
	@echo "        Starts a commandline session and allows you to chat with the bot."
	@echo "    visualize"
	@echo "        Draws the dialogue training data as a graph."

install:
	pip install rasa_core
	pip install rasa_nlu[spacy]
	python -m spacy download en_core_web_md
	python -m spacy link --force en_core_web_md en

interactive:
	python -m rasa_core.train -s stories.md -d domain.yml -o models/dialogue --epochs 250 --online --nlu models/nlu/default/current

train-nlu:
	python -m rasa_nlu.train -c config.yml --fixed_model_name current --data nlu.md -o models/nlu

train-core:
	python -m rasa_core.train -s stories.md -d domain.yml -o models/dialogue --epochs 250

cmdline:
	python -m rasa_core.run -d models/dialogue -u models/nlu/default/current --debug

visualize:
	python -m rasa_core.visualize -s data/stories.md -d domain.yml -o story_graph.png
