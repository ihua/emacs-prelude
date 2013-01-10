;; no scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; enter as newline-and-indent
(global-set-key (kbd "RET") 'newline-and-indent)
;; invoke M-x without alt key
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
;; kill region
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
;; aliases
(defalias 'qrr 'query-replace-regexp)
;; set path
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell
      (replace-regexp-in-string "[[:space:]\n]*$" ""
         (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when (equal system-type 'darwin) (set-exec-path-from-shell-PATH))
;; jump to nrepl windows
(add-to-list 'same-window-buffer-names "*nrepl*")
(setq nrepl-popup-stacktraces nil)
(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)
