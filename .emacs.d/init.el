;; load-path を追加する関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;; 行数を追加する
(global-linum-mode t)

;; TABの表示幅
(setq-default tab-width 4)

;; gtags-modeのキーバインドを有効化する
(setq gtags-suggested-key-mapping t) ; 無効化する場合はコメントアウト(標準キーバインドを奪うので..)
(require 'gtags nil t)