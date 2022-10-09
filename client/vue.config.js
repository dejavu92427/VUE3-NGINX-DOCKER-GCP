const { defineConfig } = require("@vue/cli-service")
const { version } = require("./package.json")
module.exports = defineConfig({
  transpileDependencies: true,
  // configureWebpack(config) {},
  pages: {
    index: {
      // entry for the page
      entry: "src/main",
      // the source template
      template: "public/index.html",
      // output as dist/index.html
      filename: "index.html",
      // when using title option,
      // template title tag needs to be <title><%= htmlWebpackPlugin.options.title %></title>
      title: version,
      chunks: ["chunk-vendors", "chunk-common", "index"],
    },
  },
  devServer: {
    historyApiFallback: true, //設為false可模擬SSR(server side render) 當頁面刷新時server返回對應資源，若url沒有就404
  },
})
