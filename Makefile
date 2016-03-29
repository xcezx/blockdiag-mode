EMACS ?= emacs
ELS = blockdiag-mode.el
ELCS := $(ELS:.el=.elc)

.DEFAULT_GOAL := test

test: clean compile
	$(EMACS) -Q -batch -L . -l test/blockdiag-mode-test.el -f ert-run-tests-batch-and-exit

clean:
	$(RM) $(ELCS)

compile: $(ELCS)
%.elc: %.el
	$(EMACS) -Q -batch -L . -f batch-byte-compile $<

