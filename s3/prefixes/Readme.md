
## Create our bucket
```sh
aws s3 mb s3://prefixes-fun-mko-2018
```

## Create our folder

```sh
   aws s3api put-object --bucket="prefixes-fun-mko-2018" --key="hello/"
```

## Create many folders
```sh
   aws s3api put-object --bucket="prefixes-fun-mko-2018" --key="Lorem/ipsum/dolor/sit/amet/consectetur/adipiscing/elit/Ut/varius/fermentum/leo/in/pharetra/Vivamus/non/tincidunt/eros/et/pharetra/nulla/Vivamus/ornare/vulputate/sem/et/maximus/quam/convallis/et/In/hac/habitasse/platea/dictumst/Morbi/a/magna/sit/amet/magna/efficitur/commodo/quis/sit/amet/ex/Duis/magna/eros/ullamcorper/nec/sapien/eu/ornare/efficitur/ligula/Morbi/sollicitudin/pharetra/metus/eu/iaculis/erat/fermentum/ut/Phasellus/laoreet/velit/in/congue/sagittis/Fusce/ultricies/turpis/nulla/eu/rhoncus/metus/placerat/sed/Praesent/mattis/nulla/nisi/vel/varius/dolor/sodales/vitae/Ut/bibendum/vulputate/est/ut/sollicitudin/orci/consequat/ut/Proin/malesuada/commodo/leo/egestas/consequat/Aliquam/sem/justo/condimentum/sit/amet/mauris/vel/volutpat/varius/libero/Quisque/ultrices/tempus/est/Fusce/gravida/suscipit/turpis/a/ultricies/turpis/gravida/a/Fusce/placerat/ante/sapien/pellentesque/pretium/nibh/volutpat/nec/Sed/sit/amet/lorem/nulla/Aliquam/turpis/ex/molestie/in"
```

## Try and break the 1024 limit
```sh
   aws s3api put-object --bucket="prefixes-fun-mko-2018" --key="Lorem/ipsum/dolor/sit/amet/consectetur/adipiscing/elit/Ut/varius/fermentum/leo/in/pharetra/Vivamus/non/tincidunt/eros/et/pharetra/nulla/Vivamus/ornare/vulputate/sem/et/maximus/quam/convallis/et/In/hac/habitasse/platea/dictumst/Morbi/a/magna/sit/amet/magna/efficitur/commodo/quis/sit/amet/ex/Duis/magna/eros/ullamcorper/nec/sapien/eu/ornare/efficitur/ligula/Morbi/sollicitudin/pharetra/metus/eu/iaculis/erat/fermentum/ut/Phasellus/laoreet/velit/in/congue/sagittis/Fusce/ultricies/turpis/nulla/eu/rhoncus/metus/placerat/sed/Praesent/mattis/nulla/nisi/vel/varius/dolor/sodales/vitae/Ut/bibendum/vulputate/est/ut/sollicitudin/orci/consequat/ut/Proin/malesuada/commodo/leo/egestas/consequat/Aliquam/sem/justo/condimentum/sit/amet/mauris/vel/volutpat/varius/libero/Quisque/ultrices/tempus/est/Fusce/gravida/suscipit/turpis/a/ultricies/turpis/gravida/a/Fusce/placerat/ante/sapien/pellentesque/pretium/nibh/volutpat/nec/Sed/sit/amet/lorem/nulla/Aliquam/turpis/ex/molestie/in/urna/vitae/eleifend/fusce/testing/s3/prefix/limit/demo/aws/example/hello.txt" --body="hello.txt"
```

