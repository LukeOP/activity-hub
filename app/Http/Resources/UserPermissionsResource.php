<?php

namespace App\Http\Resources;

use App\Traits\TimestampConversionTrait;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserPermissionsResource extends JsonResource
{
    use TimestampConversionTrait;
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'school_id' => $this->school_id,
            'name' => $this->school->name,
            'type' => $this->permission_type,
            'timestamps' => [
                'created' => $this->convertToUserTimezone($this->created_at),
                'updated' => $this->convertToUserTimezone($this->updated_at),
                'deleted' => $this->convertToUserTimezone($this->deleted_at),
            ]
        ];
    }
}
