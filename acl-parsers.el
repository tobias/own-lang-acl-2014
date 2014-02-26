(let* ((preso-dir (expand-file-name "~/presentations/parsers-acl/"))
       (code-dir (expand-file-name "~/hack/bumpkin/"))
       (clojure-dir (concat code-dir "bumpkin-clj/"))
       (ruby-dir (concat code-dir "bumpkin-rb/")))

  (dired ruby-dir)
  (shell)

  (find-file (concat preso-dir "parsing.org"))
  (org-reveal-export-to-html)

  (open-files-in-dir (concat ruby-dir "lib/bumpkin/"))
  (open-read-only (concat ruby-dir "lib/bumpkin.rb"))

  (open-files-in-dir (concat clojure-dir "src/bumpkin_clj/"))
  (switch-to-buffer "parser.clj")
  (cider-jack-in)

  (find-file (concat code-dir "factorial.bk"))
  (downplay-mode 1)

  (shell-command (format "chromium-browser --new-window file:%sparsing.html" preso-dir))

  (dolist (url '("http://www.dangermouse.net/esoteric/piet.html"
                 "https://github.com/sankha93/morse" "http://en.wikipedia.org/wiki/Brainfuck"
                 "http://en.wikipedia.org/wiki/Whitespace_(programming_language)"
                 "http://www.futureboy.us/frinkdocs/"
                 "https://www.youtube.com/watch\\?v=_P9HqHVPeik"))
    (shell-command (format "chromium-browser %s" url))))

