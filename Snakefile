# --- Aliases --- #
# jupyter command alias


jupyter_py3 = "jupyter nbconvert --to notebook --execute --ExecutePreprocessor.kernel_name=python3 --ExecutePreprocessor.timeout=500"


# --- Build Rule --- #
## run_notebook:  Builds the Jupyter notebook

rule run_notebook:
    input:
        notebook = "scraper_forms.ipynb",
    output:
        notebook = "input\\scraper_forms.nbconvert.ipynb"
    shell: # output needs to be relative to notebook location
        "{jupyter_py3} {input.notebook} --output ../{output.notebook}"
