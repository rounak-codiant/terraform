
# Fatch availability zones
data "aws_availability_zones" "available" {
  state = "available"
  #   filter {
  #   name   = "opt-in-status"
  #   values = ["opted-in"]
  # }
}

# Internet Gateway Create
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.project_name}-IG"
    Environment = "${var.env_suffix}"
  }
}

# Create Public Subnet
resource "aws_subnet" "public_subnet" {
  count             = length(var.public_cidr_block)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.public_cidr_block, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index % length(var.public_cidr_block)]
  tags = {
    Name        = "${var.project_name}-Public-Subnet-${count.index}"
    Environment = "${var.env_suffix}"
  }
}

# Create Private Subnet
resource "aws_subnet" "private_subnet" {
  count             = length(var.private_cidr_block)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.private_cidr_block, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index % length(var.private_cidr_block)]
  tags = {
    Name        = "${var.project_name}-Private-Subnet-${count.index}"
    Environment = "${var.env_suffix}"
  }
}

# Create Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name        = "${var.project_name}-Public-RT"
    Environment = "${var.env_suffix}"
  }
}

# Public Subnet Association
resource "aws_route_table_association" "public_rt_association" {
  count          = length(aws_subnet.public_subnet.*.id)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}

# Create Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  route  = []
  #   route {
  #     cidr_block     = "0.0.0.0/0"
  #     nat_gateway_id = aws_nat_gateway.natgw.id
  #   }
  tags = {
    Name        = "${var.project_name}-Private-RT"
    Environment = "${var.env_suffix}"
  }
}

# Private Subnet Association
resource "aws_route_table_association" "private_rt_association" {
  count          = length(aws_subnet.private_subnet.*.id)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_route_table.id
}

# VPC Create
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name        = "${var.project_name}-VPC"
    Environment = "${var.env_suffix}"
  }
}



# Enable when you want create NAT Gataways
# #-----------------------------
# # EIP For NAT Gateway
# #----------------------------
# resource "aws_eip" "nat_eip" {
#   vpc = true
#   tags = {
#     Name        = "${var.project_name}-nat-eip"
#     Environment = "${var.env_suffix}"
#   }
# }

# #-----------------------------
# # NAT Gateway Create
# #----------------------------
# resource "aws_nat_gateway" "natgw" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = element(aws_subnet.public_subnet.*.id, 0)

#   depends_on = [aws_internet_gateway.igw]
#   tags = {
#     Name        = "${var.project_name}-NAT"
#     Environment = "${var.env_suffix}"
#   }
# }
