.PHONY: lint
lint:
	@echo 'Linting Flutter files...'
	@flutter analyze

.PHONY: test
test:
	@echo 'Running Flutter tests...'
	@flutter test

.PHONY: sort-imports
sort-imports:
	@echo 'Sorting imports for the application...'
	@flutter pub run import_sorter:main

.PHONY: icons
icons:
	@echo 'Regenerating Flutter icons...'
	@flutter pub get
	@flutter pub run flutter_launcher_icons:main
