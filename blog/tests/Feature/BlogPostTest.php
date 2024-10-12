<?php

namespace Tests\Feature;

use App\Models\Post;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class BlogPostTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function a_user_can_create_a_blog_post()
    {
        $postData = [
            'title' => 'Test Blog Post',
            'content' => 'This is the content of the test blog post.',
            'category_id' => 1,
        ];

        $response = $this->post('/posts', $postData);

        $response->assertStatus(201);
        $this->assertDatabaseHas('posts', $postData);
    }

    /** @test */
    public function a_user_can_view_a_blog_post()
    {
        $post = Post::factory()->create();

        $response = $this->get("/posts/{$post->id}");

        $response->assertStatus(200);
        $response->assertSee($post->title);
    }

    /** @test */
    public function a_user_can_update_a_blog_post()
    {
        $post = Post::factory()->create();

        $updatedData = [
            'title' => 'Updated Title',
            'content' => 'Updated content.',
        ];

        $response = $this->put("/posts/{$post->id}", $updatedData);

        $response->assertStatus(200);
        $this->assertDatabaseHas('posts', $updatedData);
    }

    /** @test */
    public function a_user_can_delete_a_blog_post()
    {
        $post = Post::factory()->create();

        $response = $this->delete("/posts/{$post->id}");

        $response->assertStatus(204);
        $this->assertDatabaseMissing('posts', ['id' => $post->id]);
    }
}
