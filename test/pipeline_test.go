package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestPipelineInfrastructure(t *testing.T) {
	opts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "..",
	})

	defer terraform.Destroy(t, opts)

	terraform.InitAndApply(t, opts)

	bucketName := terraform.Output(t, opts, "s3_bucket_name")
	assert.Contains(t, bucketName, "devops-masters-artifacts")
}
