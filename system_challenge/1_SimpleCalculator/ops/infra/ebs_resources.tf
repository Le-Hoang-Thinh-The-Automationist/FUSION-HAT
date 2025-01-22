resource "aws_volume_attachment" "ebs_att_fe_web" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_vol_ebs_fe_web.id
    instance_id = aws_instance.fe_web_instance.id
}

resource "aws_ebs_volume" "ebs_vol_ebs_fe_web" {
  availability_zone = var.deloy_az
  size = 1
}
resource "aws_volume_attachment" "ebs_att_be_app" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_vol_ebs_be_app.id
    instance_id = aws_instance.be_application_instance.id
}

resource "aws_ebs_volume" "ebs_vol_ebs_be_app" {
  availability_zone = var.deloy_az
  size = 1
}