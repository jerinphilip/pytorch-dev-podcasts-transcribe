import requests
from lxml import etree


def download(url, fpath):
    get_response = requests.get(url, stream=True)
    with open(fpath, "wb") as f:
        for chunk in get_response.iter_content(chunk_size=1024):
            if chunk:  # filter out keep-alive new chunks
                f.write(chunk)


if __name__ == "__main__":
    URL = "https://feeds.simplecast.com/OB5FkIl8"
    page = requests.get(URL)
    tree = etree.fromstring(page.content)
    nodes = tree.xpath("//item")
    print(len(nodes))
    for node in nodes:
        enclosure = node.xpath("./enclosure")
        if enclosure:
            mp3_url = enclosure[0].get("url")
            title = node.xpath("./title/text()")[0]
            print(title)
            title = title.replace(" ", "-") + ".mp3"
            download(mp3_url, title)
