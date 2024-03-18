import torch
import time

def matmul_on_all_gpus(duration_sec=180, rest_duration_sec=1800):
    # Find all available GPU devices
    device_count = torch.cuda.device_count()
    if device_count == 0:
        print("No GPU devices available. Exiting.")
        return

    devices = [torch.device(f'cuda:{i}') for i in range(device_count)]

    # Run the loop indefinitely
    while True:
        start_time = time.time()
        with torch.no_grad():  # Enable no gradient mode
            while (time.time() - start_time) < duration_sec:
                for device in devices:
                    # Initialize random matrices
                    matrix1 = torch.randn(32, 32, dtype=torch.float16, device=device)
                    matrix2 = torch.randn(32, 32, dtype=torch.float16, device=device)

                    # Perform matrix multiplication
                    result = torch.matmul(matrix1, matrix2)
                    torch.cuda.synchronize(device)
                    # You can include some output to monitor the process
                    # print(f"Performed matmul on {device}")

        # Rest for 30 minutes
        # print("Resting for 30 minutes.")
        time.sleep(rest_duration_sec)

# Run the function
matmul_on_all_gpus()