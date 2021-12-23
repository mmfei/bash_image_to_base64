# usage
```bash
# print base64 code
sh ./image_to_base64.sh ~/Downloads/testImage png,gif,jpg
# save to json code
sh ./image_to_base64.sh ~/Downloads/testImage png,gif a.json

# if Permission denied
# chmod +x image_to_base64.sh
```

## result
```json
{
    "download.png":"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAkFBMVEUpp="
}
```