# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator
# ---------------------------------------------------------------------------------------------------------------------

variable "project" {
  type        = string
}

variable "region" {
  type        = string
}

variable "name_prefix" {
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# Generally, these values won't need to be changed.
# ---------------------------------------------------------------------------------------------------------------------

variable "cidr_block" {
  default     = "10.0.0.0/16"
  type        = string
}

variable "cidr_subnetwork_width_delta" {
  type        = number
  default     = 4
}

variable "cidr_subnetwork_spacing" {
  type        = number
  default     = 0
}

variable "secondary_cidr_block" {
  type        = string
  default     = "10.1.0.0/16"
}

variable "secondary_cidr_subnetwork_width_delta" {
  type        = number
  default     = 4
}

variable "secondary_cidr_subnetwork_spacing" {
  type        = number
  default     = 0
}

variable "enable_flow_logging" {
  type        = bool
  default     = true
}

variable allowed_public_restricted_subnetworks {
  default     = []
  type        = list(string)
}
