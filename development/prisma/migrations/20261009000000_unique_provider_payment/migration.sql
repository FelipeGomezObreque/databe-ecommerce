CREATE UNIQUE INDEX "Payment_provider_externalPaymentId_key"
ON "Payment"("provider", "externalPaymentId");
