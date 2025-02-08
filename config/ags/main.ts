import Bar from "widget/bar/Bar";
import { forMonitors } from "lib/utils";



App.config({
  windows:() => [
    ...forMonitors(Bar),
  ],
})
