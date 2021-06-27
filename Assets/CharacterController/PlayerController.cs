using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
	private MobileController PlayerInput;
    private CharacterController controller;
    private Vector3 playerVelocity;
    private bool groundedPlayer;
    public float playerSpeed = 2.0f;
    public float jumpHeight = 1.0f;
    public float gravityValue = -9.81f;

    public void Awake()
	{
		PlayerInput = new MobileController();
        controller = GetComponent<CharacterController>();
	}
	
	public void OnEnable()
	{
		PlayerInput.Enable();
	}
	
	public void OnDisable()
	{
		PlayerInput.Disable();
	}
	
	

    private void Start()
    {

    }

    void Update()
    {
        groundedPlayer = controller.isGrounded;
        if (groundedPlayer && playerVelocity.y < 0)
        {
            playerVelocity.y = 0f;
        }
		Vector2 movementInput = PlayerInput.PlayerMain.Move.ReadValue<Vector2>();
        Vector3 move = new Vector3(movementInput.x, 0f, movementInput.y);
        controller.Move(move * Time.deltaTime);
        controller.Move(move * Time.deltaTime * playerSpeed);
        Debug.Log(gameObject.transform.position);
        if (movementInput != Vector2.zero)
        {
            
            gameObject.transform.forward = move;
        }

        
        playerVelocity.y += gravityValue * Time.deltaTime;
        controller.Move(playerVelocity * Time.deltaTime);
    }
}
