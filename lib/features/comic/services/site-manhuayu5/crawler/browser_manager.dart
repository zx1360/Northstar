import 'package:puppeteer/puppeteer.dart';

// 单例模式下的Browser代理.
class BrowseManager {
  static Browser? _instance;

  // browser启动与关闭,
  static Future<Browser> getInstance() async {
    _instance ??= await puppeteer.launch(
      headless: true,
      args: [
        '--no-sandbox',
        '--disable-setuid-sandbox',
        '--disable-dev-shm-usage',
      ],
    );
    return _instance!;
  }

  static Future<void> close() async {
    await _instance?.close();
    _instance = null;
  }

  // 渲染章节内容, 返回所有图片url.
  static Future<List<String>> extractUrls(String url) async {
    final browser = await getInstance();

    // 渲染页面等到网络空闲
    final page = await browser.newPage();
    await page.goto(
      url,
      referrer: "${url.split(".com")[0]}.com",
      wait: Until.networkAlmostIdle,
      timeout: const Duration(seconds: 10),
    );

    // 等待特定selector出现
    await page.waitForSelector(
      '.chapter-image:not(.loading)',
      timeout: Duration(seconds: 10),
    );

    // 提取所有图片url. 优先取data-original, 无则取img的src
    final imageUrls = await page.evaluate<List<String>>('''() => {
      const images = document.querySelectorAll('.chapter-image');
      return Array.from(images).map(el => {
        return el.dataset.original || (el.querySelector('img')?.src || '');
      }).filter(url => url);
    }''');

    print('爬取到的图片URL: ${imageUrls.length}张: ');
    for (final url in imageUrls) {
      print(url);
    }

    return imageUrls;
  }
}
