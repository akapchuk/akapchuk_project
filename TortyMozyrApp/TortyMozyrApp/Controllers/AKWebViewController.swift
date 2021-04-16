//
//  AKWebViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 16.04.21.
//

import WebKit
import UIKit

class AKWebViewController: UIViewController {

    // MARK: - properties

    private var stringUrl: String?
    private var url: URL?

    // MARK: - gui variables
    private lazy var webView: WKWebView = {
        let view = WKWebView()
        view.navigationDelegate = self
        return view
    }()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(self.webView)

        self.webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.loadUrl()
    }

    // MARK: - initialization

    init(stringUrl: String) {
        super.init(nibName: nil, bundle: nil) // ??
        self.stringUrl = stringUrl
    }

    init(url: URL) {
        super.init(nibName: nil, bundle: nil)
        self.url = url
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - load URL

    private func loadUrl() {
        if let stringUrl = self.stringUrl, let url = URL(string: stringUrl) {
            self.webView.load(URLRequest(url: url))
        } else if let url = self.url {
            if url.isFileURL {
                self.webView.loadFileURL(url, allowingReadAccessTo: url)
            } else {
                self.webView.load(URLRequest(url: url))
            }
        }
    }
}

// MARK: - extensions

extension AKWebViewController: WKNavigationDelegate {

}
