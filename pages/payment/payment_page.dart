import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pix_flutter/pix_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/global_widgets/progressive_bar/linear_progressive_bar_widget.dart';

class PaymentPage extends StatefulWidget {
  final String sum;
  const PaymentPage({required this.sum, super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late PixFlutter pix;
  String? qrCode;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      generatePix();
    });
    showAlert();
  }

  Future<void> showAlert() async {
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Sucesso!"),
              content: const Text("O pagamento foi realizado com sucesso"),
            );
          },
        );
      }
    });
  }

  generatePix() {
    // Exemplo dinâmico — aqui você pode passar os dados do pedido:
    pix = PixFlutter(
      payload: Payload(
        pixKey:
            "felixjosias1997@gmail.com", // chave pix (pode ser email, telefone, CPF, etc)
        description: "Compra #1234 - Loja Exemplo",
        merchantName: "Loja Exemplo",
        merchantCity: "SAO PAULO",
        amount: "59.90", // valor dinâmico
        txid: "PEDIDO1234", // identificador único da transação
      ),
    );

    setState(() {
      qrCode = pix.getQRCode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pagamento")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // para a coluna ocupar só o necessário
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Pague com Pix",
                style: context.theme.textTheme.headlineMedium,
                textAlign:
                    TextAlign
                        .center, // opcional, garante centralização no texto
              ),
              const SizedBox(height: 16),

              if (qrCode != null) QrImageView(data: qrCode!, size: 220),
              const SizedBox(height: 16),
              const Text("Escaneie o QR Code com seu app bancário"),
              const SizedBox(height: 16),

              ElevatedButton.icon(
                onPressed: () {
                  // Exemplo de cópia do código Pix (para copiar e colar manualmente)
                  Clipboard.setData(ClipboardData(text: qrCode!));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Código Pix copiado!")),
                  );
                },
                icon: const Icon(Icons.copy),
                label: const Text("Copiar código Pix"),
              ),
              const SizedBox(height: 16),
              Text(
                "R\$ ${widget.sum}",
                style: context.theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              LinearProgressiveBarWidget(durationSeconds: 10),
            ],
          ),
        ),
      ),
    );
  }
}
