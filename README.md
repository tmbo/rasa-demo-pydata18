# Conversational AI with Rasa NLU and Core
Demo application for the PyData Conference in Amsterdam 2018

You can find the slides for the presentation at [Slideshare](https://www.slideshare.net/TomBocklisch/conversational-ai-with-rasa-pydata-workshop-98683172).

## Installation
The notebooks contain the installation instructions as their first step. Basically,
you'll need a virtualenv with `rasa_core`, `rasa_nlu[spacy]` and `spacy` installed.

Also make sure to install a spacy language model for `en`.

## Notebooks
- `rasa-moodbot-demo-starter` this is what we are going to start with
- `rasa-moodbot-demo-complete` this is how our notebook should look like once we are done
- `rasa-moodbot-demo-complete-executed` if hell breaks loose, this is a backup notebook with all the output cells filled

The additional files (`nlu.md`, `stories.md`, `domain.yml`, `config.yml`, `story_eval.pdf`, `story_graph.png`)
will be explained and created in the notebooks.

Once you ran the notebooks, there should be a `models/` folder containing your trained Rasa model.

## Additional Material

### Running duckling locally
- run the duckling docker container
	```bash
	docker run -p 8000:8000 rasa/duckling
	```

- add the duckling component to your pipeline:
	```yaml
	- name: "ner_duckling_http"
	  url: localhost:8000
	```

## Slides
TBC - I'll add the slides once the talk is done 
